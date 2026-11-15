# Property Management System

An academic desktop property-management project built with **Embarcadero Delphi** and database/SQL concepts. The application explores registration, administrative record management, property listing and purchase workflows.

## Project overview

The intended user journey includes account registration and login, an administrative panel, property listing and browsing, a buying flow with payment-option selection, receipts, reviews and service requests. The implementation is a coursework prototype; it is not a connected real-estate marketplace or payment processor.

## Technologies and approach

- Object Pascal / Delphi and form-based desktop UI.
- SQL-oriented data access and administrative records.
- Classes and collections for parts of the workflow.
- Project diagrams documenting the design.

## Project files

| Path | Purpose |
| --- | --- |
| `Main_p.dpr` and `Main_p.dproj` | Application/project entry point |
| `main_u.pas`, `main_u.dfm` | Main interface |
| `login_u.pas`, `login_u.dfm` | Sign-in and account flow |
| `admin_u.pas`, `admin_u.dfm` | Administrative interface |
| `buying_u.pas`, `buying_u.dfm` | Property buying flow |
| `dmData_u.pas`, `dmData_u.dfm` | Data access module |
| `flowchart.drawio` | Design diagrams |

## Opening the project

1. Install a compatible Delphi development environment on Windows.
2. Clone or download the repository and open `Main_p.dproj` in the IDE.
3. Review the database connection settings in the data module before running.
4. Supply any required database and local paths in your own environment; **a ready-to-run application database is not bundled here**.
5. Build and run within Delphi, then follow the registration/login and property management screens.

**Data note:** A `.ldb` lock file may be present from the original development environment. It is not the actual database and must not be treated as application data. Do not commit live credentials or customers' data.

## Status

Academic prototype and source reference. The repository has not been turned into a secure production system, and payment selections in the coursework must not be mistaken for a real payment gateway.

## Author

[Vhuhwavho Jonathan Masengana](https://github.com/dr4c0-0) — BSc Computer Science student.
