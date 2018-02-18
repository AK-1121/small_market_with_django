from django.urls import path, re_path
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

from . import views

urlpatterns = [
    path('', views.list_product_types, name='product_types_list'),
    path('sub_types_list/<int:type_id>/', views.SubTypeListView.as_view(), name='sub_types_list'),
    path('products_list/<int:sub_type_id>/', views.ProductsListView.as_view(), name='products_list'),
    path('product/<int:pk>/', views.show_product, name='product_page'),
    # Redirect to slash page (for cases when APPEND_SLASH will be switched off):
    re_path('^(?P<request_url>.*[^\/])$', views.WithoutSlashRedirectView.as_view()),

]  + staticfiles_urlpatterns()
