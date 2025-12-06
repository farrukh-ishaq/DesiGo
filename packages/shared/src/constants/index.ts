export const APP_NAME = 'DesiGo';
export const APP_DESCRIPTION = 'Modern Indian E-commerce Platform';

export const API_URLS = {
  PRODUCTS: '/products',
  CART: '/cart',
  ORDERS: '/orders',
  AUTH: '/auth',
  CATEGORIES: '/categories',
  COLLECTIONS: '/collections'
} as const;

export const STORAGE_KEYS = {
  AUTH_TOKEN: 'desigo_auth_token',
  CART_ID: 'desigo_cart_id',
  USER_INFO: 'desigo_user_info',
  SESSION_ID: 'desigo_session_id'
} as const;

export const ERROR_MESSAGES = {
  NETWORK_ERROR: 'Network error. Please check your connection.',
  UNAUTHORIZED: 'You need to be logged in to perform this action.',
  NOT_FOUND: 'The requested resource was not found.',
  SERVER_ERROR: 'Something went wrong on our end. Please try again later.',
  VALIDATION_ERROR: 'Please check your input and try again.'
} as const;

export const SUCCESS_MESSAGES = {
  ORDER_CREATED: 'Order placed successfully!',
  CART_UPDATED: 'Cart updated successfully!',
  PROFILE_UPDATED: 'Profile updated successfully!'
} as const;

export const CATEGORIES = {
  CLOTHING: 'clothing',
  JEWELRY: 'jewelry',
  HOME_DECOR: 'home-decor',
  BEAUTY: 'beauty',
  FOOD: 'food'
} as const;
