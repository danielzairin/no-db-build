const requiredEnvs: string[] = [
  "APP_BASE_URL",
  "CLOUDFLARE_API_TOKEN",
  "CLOUDFLARE_ZONE_ID",
];

export function register() {
  for (const key of requiredEnvs) {
    if (!process.env[key]) {
      throw Error(`missing required env var '${key}'`);
    }
  }
}
