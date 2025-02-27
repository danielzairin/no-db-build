"use client";

import { revalidateHomePage } from "./actions";

export function RevalidateButton() {
  return <button onClick={revalidateHomePage}>Revalidate HomePage</button>;
}
