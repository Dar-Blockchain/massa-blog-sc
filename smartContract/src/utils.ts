import * as dotenv from 'dotenv';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import path from 'path';

import { Args, bytesToStr } from '@massalabs/massa-web3';

dotenv.config();

export function getScByteCode(folderName: string, fileName: string): Buffer {
  // Obtain the current file name and directory paths
  const __filename = fileURLToPath(import.meta.url);
  const __dirname = path.dirname(path.dirname(__filename));
  return readFileSync(path.join(__dirname, folderName, fileName));
}

// export async function getOperationEvent(
//   operationId: string,
//   client: Client,
// ): Promise<Array<IEvent> | null> {
//   try {
//     const events = await EventPoller.getEventsOnce(
//       {
//         start: null,
//         end: null,
//         original_operation_id: operationId,
//         original_caller_address: null,
//         emitter_address: null,
//         eventsNameRegex: null,
//         is_final: null,
//       },
//       client,
//     );

//     return events;
//   } catch (error) {
//     console.error('Error In getEvents :', error);
//     return null;
//   }
// }
