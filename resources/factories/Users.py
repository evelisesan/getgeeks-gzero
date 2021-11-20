from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed
    
def factory_user(target):
    data = {
        'faker': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email(),
            'password':'pwd123'
        },
        'wrong_email':{
            'name': 'Elenor' ,
            'lastname': 'Silva e Silva',
            'email': 'elenorss&gmail.com',
            'password':'pwd123'
        },
        'login': {
            'name': 'Eve' ,
            'lastname': 'Santos',
            'email':'eve@gmail.com',
            'password':'pwd123'
        },
        'be_geek': {
            'name': 'Kim' ,
            'lastname': 'Dotcom',
            'email':'kim@dot.com',
            'password':'pwd123',
            'geek_profile':{
                'whats': '11999999999',
                'desc': 'Seu computador está lento? Talvez seja um virus, eu formato computador só me chamar e te ajudo com esse pepino',
                'printer_repair': 'Sim',
                'work': 'Remoto',
                'cost': '100'
            }

        },
        'attempt_be_geek': {
            'name': 'Tammy' ,
            'lastname': 'Porto',
            'email':'tamto@gmail.com',
            'password':'pwd123',
            'geek_profile':{
                'whats': '11999999999',
                'desc': 'Seu computador está lento? Talvez seja um virus, eu formato computador só me chamar e te ajudo com esse pepino',
                'printer_repair': 'Não',
                'work': 'Ambos',
                'cost': '200'
            }

        },
        
    }

    return data[target]