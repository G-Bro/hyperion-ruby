import { createInertiaApp } from '@inertiajs/inertia-vue3'
// import type { CreateInertiaAppProps } from '@inertiajs/inertia-vue3'
import { createApp, h } from 'vue'
// import { resolvePage } from '~/pages'

function resolvePageComponent(name, pages) {
    for (const path in pages) {
        if (path.endsWith(`${name.replace('.', '/')}.vue`)) {
            return typeof pages[path] === 'function' ?
                pages[path]() :
                pages[path]
        }
    }

    throw new Error(`Page not found: ${name}`)
}
export function install(options) {
    console.log('hi');

    return createInertiaApp({
            resolve: name =>
                resolvePageComponent(
                    name,
                    import.meta.glob("./Pages/**/*.vue")
                ),
            setup({ el, App, props, plugin }) {
                createApp({ render: () => h(App, props) })
                    .use(plugin)
                    .mount(el)
            },
        })
        // return createInertiaApp({
        //   resolve: resolvePage,
        //   setup ({ plugin, app, props, el }) {
        //     let app = Vue.use(plugin)

    //     const vueApp = new Vue({
    //       render: h => h(app, props),
    //       metaInfo: {
    //         titleTemplate (title) {
    //           return title ? `${title} - PingCRM on Vite Ruby` : 'PingCRM on Vite Ruby'
    //         },
    //       },
    //     })

    //     if (el)
    //       vueApp.$mount(el)

    //     return vueApp
    //   },
    //   ...options,
    // })
}