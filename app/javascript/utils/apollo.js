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
