import { RevalidateButton } from "./client";

export default async function Home() {
  return (
    <div>
      <p>{new Date().toString()}</p>
      <RevalidateButton />
    </div>
  );
}
