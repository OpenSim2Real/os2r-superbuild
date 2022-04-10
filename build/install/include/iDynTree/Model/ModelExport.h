
#ifndef IDYNTREE_MODEL_EXPORT_H
#define IDYNTREE_MODEL_EXPORT_H

#ifdef IDYNTREE_MODEL_STATIC_DEFINE
#  define IDYNTREE_MODEL_EXPORT
#  define IDYNTREE_MODEL_NO_EXPORT
#else
#  ifndef IDYNTREE_MODEL_EXPORT
#    ifdef idyntree_model_EXPORTS
        /* We are building this library */
#      define IDYNTREE_MODEL_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define IDYNTREE_MODEL_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef IDYNTREE_MODEL_NO_EXPORT
#    define IDYNTREE_MODEL_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef IDYNTREE_MODEL_DEPRECATED
#  define IDYNTREE_MODEL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef IDYNTREE_MODEL_DEPRECATED_EXPORT
#  define IDYNTREE_MODEL_DEPRECATED_EXPORT IDYNTREE_MODEL_EXPORT IDYNTREE_MODEL_DEPRECATED
#endif

#ifndef IDYNTREE_MODEL_DEPRECATED_NO_EXPORT
#  define IDYNTREE_MODEL_DEPRECATED_NO_EXPORT IDYNTREE_MODEL_NO_EXPORT IDYNTREE_MODEL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef IDYNTREE_MODEL_NO_DEPRECATED
#    define IDYNTREE_MODEL_NO_DEPRECATED
#  endif
#endif

#endif /* IDYNTREE_MODEL_EXPORT_H */
