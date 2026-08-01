from flask import Flask, request, jsonify
import os

app = Flask(__name__)

@app.route('/', methods=['GET'])
def home():
    return jsonify({"message": "Serveur Clipmaster operationnel !", "status": "ok"})

@app.route('/process-video', methods=['POST'])
def process_video():
    data = request.json or {}
    video_url = data.get('url')

    if not video_url:
        return jsonify({"error": "Aucune URL de vidéo fournie"}), 400

    # Ici s'exécutera la logique de découpe/sous-titrage
    return jsonify({
        "status": "processing",
        "message": f"Traitement de la vidéo : {video_url}"
    })

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 10000))
    app.run(host='0.0.0.0', port=port)
