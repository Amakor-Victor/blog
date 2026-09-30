from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.

class CustomUser(AbstractUser):
    department = models.CharField(max_length=300)
    level = models.CharField(max_length=300)
    
    
    
    


