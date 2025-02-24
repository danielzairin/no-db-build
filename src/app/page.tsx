import { mongo } from "./mongo";

export default async function Home() {
  await mongo.connect();
  const dbName = mongo.db().databaseName;
  return <div>dbName: {dbName}</div>;
}
