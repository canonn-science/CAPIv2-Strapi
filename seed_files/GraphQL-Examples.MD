GR Site:
```
# Example GraphQL Query for GR Sites
query {
  grsites {
    system {
      systemName
    }
    body {
      bodyName
    }
    siteID
    latitude
    longitude
    type {
      type
    }
    verified
    discoveredBy {
      cmdrName
    }
    activeGroups {
      activeGroup {
        groupName
        amount
      }
    }
    activeObelisks {
      activeObelisk {
        grObeliskGroup {
          groupName
        }
        obeliskNumber
        broken
        grCodexData {
          grCodexCategory {
            categoryName
          }
          codexNumber
          grPrimaryArtifact {
            artifactName
          }
          grSecondaryArtifact {
            artifactName
          }
          text
        }
      }
    }
  }
}
```


GS Site:
```
# Example GraphQL Query for GS Sites
query {
  gssites {
    system {
      systemName
    }
    body {
      bodyName
    }
    siteID
    latitude
    longitude
    type {
      type
    }
    verified
    discoveredBy {
      cmdrName
    }
    activeGroups {
      activeGroup {
        groupName
        amount
      }
    }
    activeObelisks {
      activeObelisk {
        gsObeliskGroup {
          groupName
        }
        obeliskNumber
        broken
        gsCodexData {
          gsCodexCategory {
            categoryName
          }
          codexNumber
          gsPrimaryArtifact {
            artifactName
          }
          gsSecondaryArtifact {
            artifactName
          }
          text
        }
      }
    }
  }
}
```
