import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: 'https://jiaxingtan1996.netlify.app/',
  integrations: [mdx(), sitemap()],
  markdown: {
    shikiConfig: {
      theme: 'github-light'
    }
  }
});
