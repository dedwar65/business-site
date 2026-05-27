# decoryedwards.com — Site Deployment Guide

Static site for decoryedwards.com, hosted on GitHub Pages. Three pages:

- `/` — homepage hub
- `/tutoring/` — tutoring services + booking
- `/consulting/` — consulting stub

---

## Before you deploy — fill in these 3 placeholders

### 1. Rates — in `tutoring/index.html`
Search for `[Rate TBD]` — there are three instances in the rates table. Replace with your actual prices.

### 2. Calendly link — in `tutoring/index.html`
Search for `YOUR_CALENDLY_URL` and replace with your link, e.g.:
```
https://calendly.com/decory-edwards/60min
```
Steps: sign up at calendly.com → Create event type (60 min) → Connect Stripe for payments → copy the URL.

### 3. Formspree form ID — in both `tutoring/index.html` and `consulting/index.html`
Search for `YOUR_FORM_ID` (appears twice total) and replace with your endpoint:
```
https://formspree.io/f/abcdefgh
```
Steps: sign up free at formspree.io → New form → copy the form action URL.

---

## Deployment steps

### Step 1 — Create GitHub repo
1. Go to github.com → New repository
2. Name it anything: `decoryedwards-site` works fine (the name doesn't control the URL)
3. Set to **Public**
4. Do NOT add a README (you have files to push)

### Step 2 — Push these files
From inside the `site/` folder on your machine:

```bash
cd /Users/dc/Dropbox/Master/site
git init
git remote add origin https://github.com/dedwar65/decoryedwards-site.git
git add .
git commit -m "initial site"
git push -u origin main
```

### Step 3 — Enable GitHub Pages
1. In the GitHub repo: **Settings → Pages**
2. Source: **Deploy from a branch**
3. Branch: `main` / root
4. Save
5. Custom domain: type `decoryedwards.com` → Save
6. Check **Enforce HTTPS** (may take a few minutes to become available)

### Step 4 — Update DNS in Squarespace
Go to your Squarespace domain settings → DNS. Replace existing A records for `@` with GitHub's IPs:

```
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

Add (or update) a CNAME record:
```
Host: www
Points to: dedwar65.github.io
TTL: 3600
```

DNS propagates in 30 min – 48 hours. Site goes live once propagation completes.

### Step 5 — Cancel Squarespace website plan
Keep the **domain registration** in Squarespace (~$20/yr). Cancel the **website plan** only.
In Squarespace: Account → Billing → Cancel Website Plan.

---

## Email — decory@decoryedwards.com

The footer links to `decory@decoryedwards.com`. To activate this address:
- Sign up for **Google Workspace Business Starter** (~$7/mo)
- Add `decoryedwards.com` as your domain
- Squarespace DNS: add the MX records Google Workspace gives you
- Verify → email is live

---

## Accounts you need

| Service | Purpose | Cost | Sign up |
|---|---|---|---|
| Calendly Standard | Booking + Stripe payment | $10/mo | calendly.com |
| Formspree | Contact forms | Free (50/mo) | formspree.io |
| Google Workspace | Custom email + eSign contracts | $7/mo | workspace.google.com |
| Stripe | Payment processor | 2.9% + $0.30/txn | stripe.com |

---

## After launch — next steps

1. **Google intake form** — collect student name, grade, subjects, goals before first session. Google Forms (free in Workspace).
2. **Service agreement template** — one-page contract with all required clauses (see `Tutoring/Plan/02-tutoring-business-plan.md`). Sign via Google eSignature (included in Workspace).
3. **Background check** — Checkr.com, ~$30 one-time. Do this before the first student session.
4. **Calendly → Stripe connection** — in Calendly settings, connect Stripe so payment is collected at booking.
5. **Per-student Dropbox folders** — create one per student. Share Zoom recording link there after each session.
