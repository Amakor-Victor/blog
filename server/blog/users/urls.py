from django.urls import path
from rest_framework_simplejwt.views import TokenRefreshView


from . import views
urlpatterns=[
    path('register/',views.CreateUserView.as_view(),name = 'register'),
    path('refresh/',TokenRefreshView.as_view(),name = 'refresh'),
    path('login/',views.CustomObtainTokenView.as_view(),name = 'login')
]