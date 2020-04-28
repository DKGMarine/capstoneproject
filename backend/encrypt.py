import json

def encrypt(key, message):
    message = message.upper()
    alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890@"
    result = ""

    for letter in message:
        if letter in alpha:
            letter_index = (alpha.find(letter) + key) % len(alpha)
            result = result + alpha[letter_index]
        else:
            result = result + letter

    return result

def decrypt(key, message):
    message = message.upper()
    alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890@"
    result = ""

    for letter in message:
        if letter in alpha:
            letter_index = (alpha.find(letter) - key) % len(alpha)

            result = result + alpha[letter_index]
        else:
            result = result + letter
    return result



#if __name__ == '__main__':

#    data = {
#        'Name' : 'Bassam',
#        'Age'  : '25',
#        'School' : 'UNT'
#     }
    #x = encrypt(3, 'Deep Holes')
#
#    for i in data:
#        temp = data[str(i)]
#        temp = encrypt(5, temp)
#        data[str(i)] = temp

#    print(data)

#    for i in data:
#        temp = data[str(i)]
#        temp = decrypt(5, temp)
#        data[str(i)] = temp


#    print(data)

    #y = encrypt(40, 'Deep Hole')

    #print(y)

    #print(decrypt(3, x))
