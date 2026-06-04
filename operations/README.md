# Email Report — decoryedwards.com

Fetches emails from all three inboxes, classifies them, and exports an Excel report.

**Inboxes covered:**
- `decory@decoryedwards.com`
- `tutoring@decoryedwards.com`
- `consulting@decoryedwards.com`

---

## First-time setup (do once)

### 1. Install dependencies

```
cd C:\Users\dctru\Dropbox\Github\business-site\operations
pip install google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client openpyxl
```

### 2. Create a Google Cloud project and OAuth credentials

1. Go to [console.cloud.google.com](https://console.cloud.google.com)
2. Create a new project (name it anything, e.g. "decory-email-reports")
3. In the left menu → **APIs & Services** → **Enable APIs and Services**
4. Search for **Gmail API** and click **Enable**
5. Go to **APIs & Services** → **OAuth consent screen**
   - User type: **External**
   - App name: anything (e.g. "Email Report")
   - Support email: your email
   - Save and continue through the rest (no scopes needed in the form)
   - Under **Test users**, add all three addresses:
     - `decory@decoryedwards.com`
     - `tutoring@decoryedwards.com`
     - `consulting@decoryedwards.com`
6. Go to **APIs & Services** → **Credentials**
   - Click **Create Credentials** → **OAuth client ID**
   - Application type: **Desktop app**
   - Name: anything
   - Click **Create**
7. Click **Download JSON** on the new credential
8. Rename the downloaded file to `credentials.json`
9. Move it to: `C:\Users\dctru\Dropbox\Github\business-site\operations\credentials.json`

### 3. First run (triggers browser login)

```
python fetch_emails.py
```

A browser window will open asking you to sign in. Sign in with your Google Workspace account. You may see a warning ("this app isn't verified") — click **Advanced** → **Go to app (unsafe)** — this is safe since you created the app yourself.

After login, a `token.json` file is saved locally. You won't need to log in again unless you delete it.

---

## Running the report

```
# Default: last 14 days, up to 100 emails per inbox
python fetch_emails.py

# Last 30 days
python fetch_emails.py --days 30

# Last 7 days, max 50 per inbox
python fetch_emails.py --days 7 --max 50
```

The Excel file is saved to `output/email_report_YYYYMMDD_HHMM.xlsx`.

---

## Output columns

| Column | Description |
|--------|-------------|
| Inbox | Which address received it |
| Date | Received date/time |
| Sender | Sender's email address |
| Subject | Email subject line |
| Category | Auto-classified type |
| Status | New / Info / Review |
| Recommended Action | Suggested next step |

**Categories:**
- `Tutoring Lead` — reply within 24h, confirm availability
- `Consulting Lead` — reply within 24h, schedule discovery call
- `Calendly / Booking` — review booking details
- `Stripe / Payment` — verify payment received
- `Wave / Invoice` — confirm invoice status
- `Bluevine / Banking` — review account alert
- `Transactional / System` — automated, no action needed
- `General / Unknown` — review manually

---

## Files

```
operations/
├── fetch_emails.py       # main script
├── credentials.json      # from Google Cloud (you provide, not in git)
├── token.json            # auto-generated after first login (not in git)
├── output/               # Excel reports saved here
└── README.md
```

**Do not commit `credentials.json` or `token.json` to git.**
