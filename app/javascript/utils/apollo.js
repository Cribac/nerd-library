import { ApolloClient } from 'apollo-client';
import { InMemoryCache } from 'apollo-cache-inmemory';
import { HttpLink } from 'apollo-link-http';
import { onError } from 'apollo-link-error';
import { ApolloLink, Observable} from 'apollo-link';

/**
 * By default, a cache key is a concatenation of the object id and __typename.
 * Thus, fetching the same object twice would result only in one request.
 *
 * @returns {InMemoryCache}
 */
export const createCache = () => {
    const cache = new InMemoryCache();
    if (process.env.NODE_ENV === 'development') {
        window.secretVariableToStoreCache = cache;
    }
    return cache;
};

// getToken from meta tags
const getToken = () => {
  document.querySelector('meta[name="csrf-token"]').getAttribute('content');
};
const token = getToken();
const setTokenForOperation = async operation =>
    operation.setContext({
        headers: {
            'X-CSRF-Token': token,
        },
    });

// link with token
const createLinkWithToken = () => {
    new ApolloLink(
        (operation, forward) => {
            new Observable(observer => {
                let handle;
                Promise.resolve(operation)
                    .then(setTokenForOperation)
                    .then(() => {
                        handle = forward(operation).subscribe({
                            next: observer.next.bind(observer),
                            error: observer.error.bind(observer),
                            complete: observer.complete.bind(observer),
                        });
                    })
                    .catch(observer.error.bind(observer));
                return () => {
                    if (handle) handle.unsubscribe();
                };
            })
        })
};
