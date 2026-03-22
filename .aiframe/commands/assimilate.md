# Command: `/assimilate`

## Objective
Seamlessly ingest external knowledge, system constraints, or API specifications via Model Context Protocol (MCP) and instantly translate them into AIFrameOS Machine Law (SSOT YAMLs).

## Trigger & Input
Invoked by the user or an agent when an external tool or data source holds required context not present in the local `.aiframe/dev-docs/ssot/`.
Input arguments:
- `mcp_tool`: The name of the active MCP tool/resource.
- `target_query`: The specific ticket, design, or schema to fetch.

## Execution Steps

1. **Tool Invocation**:
   - The agent calls the specified `mcp_tool` with the `target_query` (e.g., fetching a Jira ticket, retrieving a database schema, reading a Figma node).

2. **Data Extraction**:
   - The agent extracts the raw JSON/text returned by the MCP server.

3. **Translation to Machine Law**:
   - The agent automatically parses the extracted data and writes it into a highly structured `.yaml` file inside `.aiframe/dev-docs/ssot/` so that future PRPs can use it as a strict constraint.
   
4. **Registration**:
   - The new SSOT file is categorized, and the agent confirms the assimilation is complete.
