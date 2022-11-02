import { createInertiaApp } from '@inertiajs/inertia-vue3'
import { createApp, h } from 'vue'

// I can't figure out the type of pages, so fuck all of y'all, I'm using any
function resolvePageComponent(name: String, pages: any) {
  for (const path in pages) {
    if (path.endsWith(`${name.replace('.', '/')}.vue`)) {
      return typeof pages[path] === 'function' ?
        pages[path]() :
        pages[path]
    }
  }

  throw new Error(`Page not found: ${name}`)
}
export function install() {
  return createInertiaApp({
    resolve: name =>
      resolvePageComponent(
        name,
        import.meta.glob("./Pages/**/*.vue")
      ),
    setup({ el, app, props, plugin }) {
      createApp({ render: () => h(app, props) })
        .use(plugin)
        .mount(el)
    },
  })
}