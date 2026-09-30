from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from django.contrib.auth import get_user_model


User = get_user_model()


class CreateUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["username","email","password","level","department"]
        extra_kwargs = {'password':{'write_only' : 'true'}}
        
    def create(self, validated_data):
        user = User.objects.create_user(username= validated_data['username'],email = validated_data['email'],password = validated_data.get('password',''),level = validated_data.get('level',''),department = validated_data.get('department',''))
        return user
    
class CustomObtainTokenSerializer(TokenObtainPairSerializer):
    def validate(self, attrs):
        data =  super().validate(attrs)
        data['user']= {
                     'id':self.user.id,
                        'username':self.user.username,
                        'email':self.user.email,
                        'level':getattr(self.user,'level',''),
                        'department':getattr(self.user,'department',''),

        }
        return data
    
        
        