#!/bin/bash

# Skript zum Einrichten eines kleinen Sprachmodells auf Raspberry Pi

echo "System aktualisieren..."
sudo apt full-upgrade -y
sudo apt autoremove -y

echo "Python3 und Pip installieren..."
sudo apt install python3 python3-pip git -y

echo "Pip upgraden..."
pip3 install --upgrade pip

echo "Transformers-Bibliothek installieren..."
pip3 install transformers torch

echo "Repository für Beispielmodell klonen (optional)..."
# Optional: Klone ein Repository mit Beispielcode
# git clone https://github.com/your-repo/example-llama-setup.git

echo "Beispiel: Modell laden und testen..."
cat <<EOF > test_model.py
from transformers import AutoModelForCausalLM, AutoTokenizer

model_name = "gpt2"  # Für kleinere Modelle geeignet
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForCausalLM.from_pretrained(model_name)

prompt = "Hallo, wie geht es dir?"
inputs = tokenizer(prompt, return_tensors="pt")
outputs = model.generate(**inputs, max_length=50)
print(tokenizer.decode(outputs[0], skip_special_tokens=True))
EOF

echo "Testskript wurde erstellt. Führen Sie es mit:"
echo "python3 test_model.py"

echo "Installation abgeschlossen."
