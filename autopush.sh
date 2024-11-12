#!/bin/bash

# Vérifier si le dépôt git est initialisé
if [ ! -d ".git" ]; then
  echo "Ce répertoire n'est pas un dépôt git."
  exit 1
fi

# Compteur pour les lots de fichiers
batch_size=500
counter=0
batch_counter=1

# Fonction pour ajouter et committer les fichiers
commit_batch() {
  echo "Ajout et commit des fichiers batch $batch_counter..."
  git commit -m "Commit batch $batch_counter"
  git push origin main
  batch_counter=$((batch_counter + 1))
}

# Scanner les fichiers en ignorant ceux dans .gitignore
find . -type f -not -path '*/\.*' | while read -r file; do
  git add "$file"
  counter=$((counter + 1))

  if [ $counter -ge $batch_size ]; then
    commit_batch
    counter=0
  fi
done

# Committer les fichiers restants
if [ $counter -gt 0 ]; then
  commit_batch
fi

echo "Tous les fichiers ont été ajoutés et poussés par lots de $batch_size."