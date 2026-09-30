from django.shortcuts import render
from rest_framework.generics import GenericAPIView,CreateAPIView
from django.contrib.auth import get_user_model
from rest_framework import permissions
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework.response import Response
from rest_framework import status
# Create your views here.

User = get_user_model()

from . import serializers

class CreateUserView(GenericAPIView):
# class CreateUserView(CreateAPIView):
    permission_classes = [permissions.AllowAny]
    queryset = User.objects.all()
    serializer_class = serializers.CreateUserSerializer
    def post(self,request):
        validated_data = request.data
        serializer = serializers.CreateUserSerializer(data = validated_data);
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    

class CustomObtainTokenView(TokenObtainPairView):
    serializer_class = serializers.CustomObtainTokenSerializer
    

    
