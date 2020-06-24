#!/bin/sh

# Checking if current tag matches the package version
current_tag=$(echo $GITHUB_REF | tr -d 'refs/tags/v')
file_tag=$(grep '<Version>' src/Meilisearch/Meilisearch.csproj | cut -d '>' -f 2 | cut -d '<' -f 1 | tr -d ' ')
if [ "$current_tag" != "$file_tag" ]; then
  echo "Error: the current tag does not match the version in package file(s)."
  echo "$current_tag vs $file_tag"
  exit 1
fi

echo 'OK'
exit 0
