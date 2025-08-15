# posts/tests.py
from django.test import TestCase
from django.urls import reverse
from http import HTTPStatus

# Create your tests here.
from .models import Posts


class PostTests(TestCase):
    @classmethod
    def setUpTestData(cls):
        cls.posts = Posts.objects.create(text="This is a Test.")

    # only functions that start with the name test will be run!
    def test_model_content(self):
        self.assertEqual(self.posts.text, "This is a Test.")

    def test_url_exists_at_correct_location(self):
        res = self.client.get("/")
        self.assertEqual(res.status_code, HTTPStatus.OK)

    def test_url_available_by_name(self):
        res = self.client.get(reverse('home'))
        self.assertEqual(res.status_code, HTTPStatus.OK)

    def test_template_name_correct(self):
        res = self.client.get(reverse('home'))
        self.assertTemplateUsed(res, 'home.html')

    def test_template_contents(self):
        res = self.client.get(reverse('home'))
        self.assertContains(res, "This is a Test.")