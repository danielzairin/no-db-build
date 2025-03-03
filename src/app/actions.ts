"use server";

import { cloudflare } from "./cloudflare";

export async function revalidateHomePage() {
  cloudflare.cache.purge({
    zone_id: process.env.CLOUDFLARE_ZONE_ID,
    files: [process.env.APP_BASE_URL],
  });
}
