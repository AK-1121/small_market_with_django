import json
import os

from django.shortcuts import render
from django.views.generic.base import RedirectView
from django.views.generic.list import ListView
from django.conf import settings


from .models import Product, ProductType, SaleVariant, SubProductType


# Create your views here.
def list_product_types(request):
    all_types = ProductType.objects.all()
    top_types = all_types[:7]
    return render(request, 'list_types.html', {'all_types': all_types, 'top_types': top_types})


class SubTypeListView(ListView):
    template_name = 'list_items.html'
    model = SubProductType

    def get_context_data(self, **kwargs):
        context = super(SubTypeListView, self).get_context_data(**kwargs)
        context['top_types'] = ProductType.objects.all()[:7]
        context['items'] = SubProductType.objects.all().filter(type_id=self.kwargs['type_id'])
        context['item_link'] = 'catalog/products_list'
        return context


class ProductsListView(ListView):
    template_name = 'list_items.html'
    model = Product

    def get_context_data(self, **kwargs):
        context = super(ProductsListView, self).get_context_data(**kwargs)
        context['top_types'] = ProductType.objects.all()[:7]
        context['items'] = Product.objects.all().filter(sub_type_id=self.kwargs['sub_type_id'])
        context['item_link'] = 'catalog/product'
        return context


def _get_product_template_name(sub_type_id, dir_name='detailed_templates'):
    templates = {

        1: "computer_laptop_product_page.html",
        2: "computer_tablet_product_page.html",
        3: "computer_pc_product_page.html",
        4: "computer_network_device_product_page.html",
        11: "home_device_refrigerator_product_page.html"
    }
    template_name = templates.get(sub_type_id, 'default_product_page.html')
    template_path = os.path.join(dir_name, template_name)
    return template_path


def _get_avarage_price(sale_variants):
    if sale_variants:
        all_prices = [variant.price for variant in sale_variants]
        average_price = round(sum(all_prices) / len(all_prices), 2)
    else:
        average_price = '-'
    return average_price


def show_product(request, pk):
    top_types = ProductType.objects.all()[:7]
    product = Product.objects.get(id=pk)
    sale_variants = SaleVariant.objects.filter(product_id=pk)
    prod_info = json.loads(product.parameters)
    template_name = _get_product_template_name(product.sub_type_id)

    average_price = _get_avarage_price(sale_variants)
    image_link = os.path.join(settings.STATIC_URL, 'images_of_products', product.image_url)

    return render(request, template_name,
                  context={
                      'product': product, 'prod_info': prod_info,
                      'top_types': top_types, 'sale_variants': sale_variants,
                      'average_price': average_price,
                      'image_link': image_link
                  })


class WithoutSlashRedirectView(RedirectView):
    permanent = True

    def get_redirect_url(self, *args, **kwargs):
        return self.request.path + '/'
