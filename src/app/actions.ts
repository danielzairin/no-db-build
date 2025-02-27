"use server";

import { cloudflare } from "./cloudflare";

export async function revalidateHomePage() {
  cloudflare.cache.purge({
    zone_id: "deb901648d3741d4e02482cac5417d89",
    files: ["https://no-db-build.danielzairin.com"],
  });
}
