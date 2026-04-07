<div align="center">

# BRAINIAC

### Elite AI Analyst for Cyber Threat Intelligence · OSINT · Threat Hunting

[![Claude Sonnet 4.6](https://img.shields.io/badge/Powered%20By-Claude%20Sonnet%204.6-blueviolet?style=for-the-badge)](https://anthropic.com)
[![Platform](https://img.shields.io/badge/Platform-Kali%20Linux%20%7C%20WSL2-informational?style=for-the-badge)]()
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)]()
[![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=for-the-badge)]()

> *"Detection rules catch what you already know. Threat hunting finds what you don't."*

</div>

---
**Note:** This release does not include all components & tools built as part of Brainiac - this is just the system prompt which will work very well as a standalone claude code plugin/slash command/skill,
the tools will be added to the repo once i complete a few bug fixes. (or maybe not, who knows)

## What is Brainiac?

**Brainiac** is an AI-powered analyst persona running on Claude Code, purpose-built for
elite-level Cyber Threat Intelligence (CTI), OSINT investigations, and advanced Cyber
Threat Hunting (CTH). It combines years of simulated domain expertise across
front-line cyber defense, deep-dive investigations, malware infrastructure hunting,
and production-grade security tooling into a single, conversational analyst.

Brainiac provides:
workflows, an organized evidence trail, automated reporting, and a persistent
investigation archive. Every engagement produces evidence-based, report-ready output.

```
You give Brainiac: a domain, IP, hash, log file, hunt hypothesis, or a tool requirement.
Brainiac gives you: enriched intelligence, a full investigation report, runnable queries,
                     or production-ready code — with reasoning, pivots, and evidence chains.
```

---

## Core Capabilities

### Cyber Threat Intelligence (CTI)

| Capability | Detail |
|---|---|
| **Intelligence Lifecycle** | Full cycle: Planning → Collection → Processing & Analysis → Dissemination → Feedback |
| **IOC Analysis** | IP/domain reputation, passive DNS, SSL/TLS cert fingerprinting, JA3/JA3S, hash classification | +more |
| **TTP Analysis** | MITRE ATT&CK mapping, kill chain identification, campaign correlation | +more |
| **Attribution** | Infrastructure overlap, code similarity, victimology, temporal analysis — with calibrated uncertainty |
| **Report Generation** | Flash Alerts, Weekly Briefs, Campaign Reports, Actor Profiles, Vulnerability Intelligence | custom |
| **STIX/TAXII** | STIX 2.1 object creation, TAXII feed consumption, relationship mapping, confidence scoring |
| **TLP Classification** | Full TLP:RED → TLP:CLEAR classification and handling |

### OSINT & Deep-Dive Investigations

Brainiac operates across the full passive OSINT stack without requiring API keys by default:

| Source Category | Tools / Services |
|---|---|
| **Infrastructure** | Shodan, Censys, FOFA, ZoomEye, Netlas | + much more |
| **Threat Feeds** | VirusTotal, OTX AlienVault, ThreatFox, MalwareBazaar, URLhaus | + much more |
| **DNS & Certificates** | Passive DNS, Certificate Transparency (crt.sh), WHOIS history | + much more |
| **Web Intelligence** | URLscan.io, GreyNoise, urlvoid, web archives | + much more |
| **Social & Paste** | Pastebin monitoring, GitHub/GitLab leaked configs | + much more |
| **Framework Tools** | Recon-ng, theHarvester, Maltego transforms, custom scrapers | + much more |
| **Government Feeds** | CISA advisories, NCSC, CERT bulletins |

**Investigation approach:**
- Automatic pivoting across sources when new observables are found
- Relationship mapping between all discovered assets
- Evidence verification before committing to report
- Full investigation archived with procedure documentation

### Cyber Threat Hunting (CTH)

Brainiac generates complete, production-ready hunt packages including hypothesis,
runnable queries, false positive analysis, and detection recommendations.

**Supported platforms:**

| Platform | Query Language | Hunting Depth |
|---|---|---|
| **Microsoft Sentinel** | KQL | Full — all tables, watchlists, UEBA |
| **Microsoft Defender for Endpoint** | KQL / Advanced Hunting | Full |
| **IBM QRadar** | AQL | Full — reference sets, offense enrichment |
| **CrowdStrike Falcon** | FQL + RTR | Full — EventSearch, memory scanning |
| **Wazuh / ELK** | Wazuh DB + Kibana | Full — decoders, rules, FIM |
| **Splunk** | SPL | Core hunting queries |

**Hunt methodologies:**

```
├── Hypothesis-Driven    → Intelligence gap → testable hypothesis → query → verdict
├── Strategic            → Business risk alignment, ATT&CK tactic coverage
├── Retroactive          → 6–12 month historical telemetry re-analysis
└── Baseline-Driven      → Statistical deviation from established normal behavior
```

**What Brainiac hunts for:**
- Living-off-the-land binaries (LOLBins) in abnormal parent-child process chains
- Low-and-slow C2 beaconing with jitter over legitimate cloud services
- Credential access via Kerberoasting, AS-REP roasting, LDAP anomalies
- Persistence: WMI event subscriptions, COM hijacking, startup folder abuse
- Lateral movement via admin shares, PsExec-like patterns, DCOM
- Defense evasion: process hollowing, unbacked memory, EDR unhooking
- Advanced Linux TTPs: IMDS credential theft, SSH tunneling, xRDP implants
- Cloud-native attacks: SSM Session Manager abuse, IAM role chaining, IMDS v1 exploitation
- much more and virtually anything you ask it to build a hypothesis For

### Security Tool Development

Brainiac designs and builds production-grade security tooling on demand.

| Layer | Stack |
|---|---|
| **Backend** | Python (FastAPI, Flask, SQLAlchemy, Celery), Go (high-throughput scanning), Node.js |
| **Frontend** | React, TypeScript, D3.js (infrastructure graph visualization), Tailwind CSS |
| **Data / Storage** | PostgreSQL + PostGIS (geo-IP mapping), TimescaleDB, Redis, Elasticsearch |
| **Infrastructure** | Docker, Kubernetes, Nginx, systemd |
| **Scraping / Collection** | Scrapy, Playwright, HTTPX, proxy rotation, rate limiting, UA management |

**Tool types Brainiac builds:**
- OSINT enrichment pipelines and REST APIs
- Malware infrastructure clustering dashboards
- IOC ingestion and correlation engines
- Custom Sentinel/Splunk data connectors
- Threat actor tracking and campaign mapping tools
- One-shot investigative scripts (no deployment overhead)

---

## Installation

### Prerequisites

- [Claude Code CLI](https://claude.ai/code) installed and authenticated
- Kali Linux or Parrot or anything similar.
- Git

### Step 1 — Clone the Repository

```bash
git clone https://github.com/Munstar0s/Claude-Brainiac.git
cd brainiac
```

### Step 2 — Run the Setup Script

```bash
chmod +x setup.sh
./setup.sh
```

The setup script will:
- Create the full `~/Brainiac/` directory tree
- Copy `CLAUDE.md` into the correct location
- Install the `/brainiac` global slash command into `~/.claude/commands/`
- Verify Claude Code is installed and accessible
- Print a startup confirmation

### Step 3 — Launch Claude Code from the Brainiac Directory

```bash
cd ~/Brainiac
claude
```

Brainiac is now active. It will introduce itself and await your investigation target,
hunt hypothesis, or tool request.

### Directory Structure (Auto-Created on First Launch)

```
~/Brainiac/
├── investigations/              # Active investigation workspaces
│   ├── <target-name>/
│   │   ├── Report/              # Final investigation report (Markdown → PDF-ready)
│   │   └── Findings-observables/  # Raw tool output, IOCs, scraped data, evidence
├── archive/                     # Completed investigations (auto-archived on close)
├── procedures/                  # Documented investigation techniques (one .md per case)
├── CTH/                         # All Cyber Threat Hunting activity
│   ├── Hypothesis/              # Full hunt workbooks (hypothesis + queries + FP analysis)
│   ├── Completed-Hunts/         # Finished, validated hunt packages
│   ├── Queries/                 # KQL/AQL/FQL/SPL query libraries organized by hunt
│   └── LogFile-Analysis/        # Log files submitted for structured analysis
└── CLAUDE.md                    # Brainiac's core instruction set
```

---

## Using Brainiac as a Claude Code Slash Command

Brainiac can be invoked from **any Claude Code session anywhere on your system**
using the `/brainiac` slash command — not just from the `~/Brainiac/` directory.
This turns Brainiac into a globally available analyst you can call mid-session in any project.

### How Claude Code Slash Commands Work

Claude Code slash commands are plain Markdown files stored in:

```
~/.claude/commands/<command-name>.md   # Global — available in every session
.claude/commands/<command-name>.md     # Project-scoped — available in this repo only
```

When you type `/brainiac <your prompt>`, Claude Code:
1. Loads the contents of `~/.claude/commands/brainiac.md` as an injected system prompt
2. Replaces the `$ARGUMENTS` placeholder with everything you typed after `/brainiac`
3. Activates Brainiac's full persona and immediately begins working on your request

### Install the Global Slash Command (Manual)

```bash
# Create the commands directory if it doesn't exist
mkdir -p ~/.claude/commands

# Copy the slash command file
cp slash-commands/brainiac.md ~/.claude/commands/brainiac.md
```

Verify installation:

```bash
ls ~/.claude/commands/
# brainiac.md
```

### Using the Slash Command

Open Claude Code in **any directory** and invoke Brainiac directly:

```
/brainiac investigate domain: malicious-infra-host[.]ru

/brainiac build a KQL hunt for Cobalt Strike beaconing on Microsoft Sentinel, last 30 days

/brainiac analyze this IP: 185.220.101.47 — is it threat actor infrastructure?

/brainiac generate a full threat hunting hypothesis for LSASS dumping evasion on CrowdStrike Falcon

/brainiac build a Python tool that enriches a list of domains using passive DNS and crt.sh
```

Brainiac will activate its full persona, working directory awareness, and structured
output format regardless of which project directory you are currently in.

---

## Intelligence Production Standards

All Brainiac reports follow structured intelligence standards:

```
├── Evidence-based only — no invented intelligence, no speculative attribution
├── Calibrated uncertainty — "Based on available evidence..." not "This is APT29"
├── TLP classification on all outputs
├── MITRE ATT&CK technique references on all TTPs identified
├── Relationship graphs for infrastructure analysis (Mermaid / ASCII)
└── Procedure documentation for every investigation technique used
```

**Report formats produced:**

| Format | Use Case | Typical Length |
|---|---|---|
| Flash Alert | Immediate threat notification | 1–2 pages |
| Campaign Report | Deep-dive on specific adversary campaign | 10–30 pages |
| Actor Profile | Comprehensive threat actor dossier | 15–40 pages |
| Hunt Package | Hypothesis + queries + results + detections | 5–15 pages |
| Investigation Report | Full OSINT/CTI investigation lifecycle output | 10–50 pages |

---

## Threat Actor Coverage

Brainiac has deep familiarity with the TTPs, infrastructure patterns, and tradecraft of:

`APT29 (Cozy Bear)` · `APT28 (Fancy Bear)` · `APT41 (Winnti)` · `Lazarus Group`
`UNC3944 (Scattered Spider)` · `Sandworm` · `APT10` · `Kimsuky` · `TA505`
`REvil / Sodinokibi` · `LockBit` · `BlackCat/ALPHV` · `Cl0p` · and more

---

## Ethical & Legal Constraints

Brainiac operates strictly within legal and ethical boundaries:

- **No exploitation** — Brainiac will never attempt to exploit, attack, or gain
  unauthorized access to any system, including attacker infrastructure
- **No ToS violations** — Only uses OSINT sources within their permitted use policies
- **Passive first** — Passive collection methods are always preferred over active scanning
- **Malware safety** — Recommends isolated sandbox analysis only; never executes
  unknown artifacts on production systems
- **API keys on request** — Tools requiring API keys are only used after explicit
  user confirmation and key provision
  
---


## Usage Examples

### Start an OSINT Investigation

```
> Investigate domain: suspicious-cdn-provider[.]net
```

Brainiac will immediately propose pivots, begin passive collection,
map all discovered relationships, verify findings across multiple sources,
and auto-generate a full investigation report when complete.

### Generate a Threat Hunt Package

```
> I need a hypothesis-driven hunt for Cobalt Strike beaconing evasion
  on Microsoft Sentinel. Environment: Windows + Linux mixed, last 60 days.
```

Brainiac produces a complete hunt workbook: hypothesis, rationale, platform-specific
queries, expected results, false positive analysis, detection recommendations, and
follow-up pivot suggestions. All saved to `CTH/Hypothesis/`.

### Analyze a Log File

```
> Analyze this <log.file> for signs of lateral movement or persistence
  [attach file or paste content]
```

Brainiac performs systematic log analysis: baseline establishment, anomaly
identification, TTP mapping, and a structured findings report.

### Build a Security Tool

```
> Build a Python script that queries VirusTotal, URLscan, and Shodan
  for a given IP and outputs a structured enrichment report.
```

Brainiac produces complete, documented, production-ready code with error handling,
rate limiting, and usage instructions.

---

## License

MIT License — See [LICENSE](LICENSE) for details.

---

## Disclaimer

Brainiac is designed for **authorized security research, threat hunting, defensive
operations, and intelligence analysis only**. All investigation activity must be
conducted against systems and targets for which you have explicit authorization.
The authors assume no liability for misuse.

---

<div align="center">

*Built for analysts who refuse to accept "we didn't see it coming."*

</div>
