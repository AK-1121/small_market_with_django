from django.urls import path, re_path
from django.contrib.staticfiles.urls import static, staticfiles_urlpatterns
from django.conf import settings

from . import views

urlpatterns = [
    path('', views.list_product_types, name='product_types_list'),
    path('sub_types_list/<int:type_id>/', views.SubTypeListView.as_view(), name='sub_types_list'),
    path('products_list/<int:sub_type_id>/', views.ProductsListView.as_view(), name='products_list'),
    # path('product/<int:pk>/', views.ProductView.as_view(), name='product_page'),
    path('product/<int:pk>/', views.show_product, name='product_page'),
    # Redirect to slash page (for cases when APPEND_SLASH will be switched off):
    re_path('^(?P<request_url>.*[^\/])$', views.WithoutSlashRedirectView.as_view()),

    # static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
] + staticfiles_urlpatterns()

# if settings.DEBUG:
#     urlpatterns += [
#         static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
#     ]
