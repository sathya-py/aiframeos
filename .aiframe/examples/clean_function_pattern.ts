/**
 * AIFrameOS Example Pattern: The Clean Error-Handled Function
 * 
 * DIRECTIVE FOR AI: When a PRP requires you to write a new utility function,
 * mimic this exact structure: 
 * 1. Strict typing for inputs and outputs.
 * 2. Return a Result/Tuple pattern instead of throwing raw exceptions.
 * 3. Include a concise, professional JSDoc/Docstring.
 */

// Example: Typescript Tuple Return Pattern
export type ServiceResult<T> = [Error | null, T | null];

/**
 * Safely parses a JSON string, returning a tuple to avoid try/catch blocks in the caller.
 * 
 * @param data - The raw JSON string.
 * @returns A tuple containing either an Error or the parsed object.
 */
export function safeJsonParse<T>(data: string): ServiceResult<T> {
  try {
    const parsed = JSON.parse(data) as T;
    return [null, parsed];
  } catch (error) {
    return [error instanceof Error ? error : new Error(String(error)), null];
  }
}
