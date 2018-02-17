import json
import os

from django.shortcuts import redirect, render
from django.http import HttpResponse
from django.core import serializers
# from django.template.loader import get_template
from django.views.generic.base import RedirectView
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView


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
        # Call the base implementation first to get a context
        context = super(SubTypeListView, self).get_context_data(**kwargs)
        # Add in the publisher
        context['top_types'] = ProductType.objects.all()[:7]
        context['items'] = SubProductType.objects.all().filter(type_id=self.kwargs['type_id'])
        context['item_link'] = 'catalog/products_list'
        return context


class ProductsListView(ListView):
    # template_name = 'list_items.html'
    template_name = 'list_items.html'
    model = Product

    def get_context_data(self, **kwargs):
        context = super(ProductsListView, self).get_context_data(**kwargs)
        context['top_types'] = ProductType.objects.all()[:7]
        context['items'] = Product.objects.all().filter(sub_type_id=self.kwargs['sub_type_id'])
        context['item_link'] = 'catalog/product'
        return context


class ProductView(DetailView):
    # template_name = 'product_page_test.html'
    template_name = 'jinja2_templates/computer_product_page.html'
    model = Product

    def get_context_data(self, **kwargs):
        context = super(ProductView, self).get_context_data(**kwargs)
        context['top_types'] = ProductType.objects.all()[:7]
        # context['prod_info'] = Product.objects.get(id=self.kwargs['product_id'])
        context['sale_variants'] = SaleVariant.objects.filter(product_id=self.kwargs['pk'])
        prod_info = json.loads(context['object'].parameters)
        context['prod_info'] = prod_info
        print(u"XX76: {}".format(dir(context['object'])))
        print(u"XX77: {}".format(context['prod_info']))
        return context


def _get_product_template_name(sub_type_id, prod_template_dir='jinja2'):
    templates = {
        1: "computer_product_page.html",
        2: "electronic_product_page.html",
        3: "home_devices_product_page.html",
        4: "child_product_page.html",
        5: "zoo_product_page.html",
        6: "home_garden_repair_product_page.html",
        7: "clothes_shoes_product_page.html",
    }
    template_name = templates.get(sub_type_id, 'default_product_page.html')
    template_path = os.path.join(prod_template_dir, template_name)
    # return template_path
    return template_name


def show_product(request, pk):
    top_types = ProductType.objects.all()[:7]
    product = Product.objects.get(id=pk)
    sale_variants = SaleVariant.objects.filter(product_id=pk)
    prod_info = json.loads(product.parameters)
    template_name = _get_product_template_name(product.sub_type_id)
    # template_name = 'product_page.html'

    return render(request, template_name,
                  context={
                      'product': product, 'prod_info': prod_info,
                      'top_types': top_types, 'sale_variants': sale_variants
                  },
                  using='jinja2')

class WithoutSlashRedirectView(RedirectView):
    permanent = True

    def get_redirect_url(self, *args, **kwargs):
        return self.request.path + '/'
