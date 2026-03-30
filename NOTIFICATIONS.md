# Notifications

Telegram-based notification system for tank action items and reminders.

## Bot

- **Name**: tank claude (@jw_tank_bot)
- **Chat ID**: `6611888222` (DM to owner)
- Token stored in memory, not in repo.

## How it works

A scheduled remote agent (Claude Code trigger) runs on a cron schedule:

1. Reads `index.md` to check the current checklist state
2. Identifies unchecked items in the active phase, upcoming deadlines, or overdue maintenance
3. Composes a short summary and sends it via the Telegram Bot API

The trigger runs in Anthropic's cloud with a git checkout of this repo. If the remote sandbox can't make outbound HTTP calls, the fallback is a local cron job on the Pi that does the same thing via `curl`.

## Trigger

- **ID**: `trig_01XVRVJuVDGrnMybwvwrfLxk`
- **Schedule**: Hourly (`0 * * * *`) — adjust when cycling starts
- **Status**: Disabled until needed
- **Manage**: https://claude.ai/code/scheduled/trig_01XVRVJuVDGrnMybwvwrfLxk

## When to enable

Enable the trigger when cycling begins (Phase 3). During cycling, daily or twice-daily notifications are useful for reminding to test water parameters. Disable again once the tank is stable and maintenance is routine.

## Sending a test message

```bash
curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
  -H "Content-Type: application/json" \
  -d '{"chat_id": "6611888222", "text": "test"}'
```
