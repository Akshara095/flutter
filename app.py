from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/calculate_bmi', methods=['POST'])
def calculate_bmi():
    data = request.get_json()
    height = data['height']
    weight = data['weight']
    
    # Calculate BMI
    bmi = weight / ((height / 100) ** 2)
    
    # Determine weight category based on BMI
    weight_category = get_weight_category(bmi)
    
    return jsonify({'bmi': bmi, 'weight_category': weight_category})

def get_weight_category(bmi):
    if bmi < 18.5:
        return 'Underweight'
    elif bmi >= 18.5 and bmi < 25:
        return 'Normal weight'
    elif bmi >= 25 and bmi < 30:
        
        return 'Overweight'
    else:
        return 'Obese'

if __name__ == '__main__':
    app.run(debug=True)
