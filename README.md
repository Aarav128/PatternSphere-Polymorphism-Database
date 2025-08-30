# Patterns Database
https://www.publicsphereproject.org/

Storing and displaying the patterns using a polymorphic schema.

To run & recreate everything in an empty phpMyAdmin Database:
- Make sure username, password, and database names are correct in each file
- run the "load" scripts under essential first
- then run the "create" scripts under essential
-   rather than running the create_head, there is a premade pattern head in the created_tables folder
- the database should be set up -- then you can run the scripts under "pages"

Current goals:
- Add author/origin, thumbnail, and some privacy/permissions(TBD) to **pattern_head** (these are the ubiquitious pattern features)
- Add other related data to the separate tables, including but not limited to:
  - links
  - child/parent patterns
  - any extra text
  - any pictures to display
- create a page to display the patterns in their polymorphic states
- add the other language versions of the patterns to the database and a way to view them differently.
- Move on from nid to a new numbering in the new pattern language -- this might be difficult to do
