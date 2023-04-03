using Test
using StringCases

import StringCases._defaultcase
import StringCases._decamelize

@testset "test_plain_string" begin
    test_string = "foo BAR bAZ"
    @test _defaultcase(test_string) == "foo bar baz"
    @test spacecase(test_string) == "foo bar baz"
    @test pascalcase(test_string) == "FooBarBaz"
    @test camelcase(test_string) == "fooBarBaz"
    @test snakecase(test_string) == "foo_bar_baz"
    @test kebabcase(test_string) == "foo-bar-baz"
end

@testset "test_delims" begin

    test_string = "this_var-here"
    @test _defaultcase(test_string) == "this var here"
    @test spacecase(test_string) == "this var here"
    @test pascalcase(test_string) == "ThisVarHere"
    @test camelcase(test_string) == "thisVarHere"
    @test snakecase(test_string) == "this_var_here"
    @test kebabcase(test_string) == "this-var-here"

end

@testset "test underscore" begin

    test_string = "foo_bar_baz"
    @test underscore("foo_bar_baz") == test_string
    @test underscore("foo bar baz") == test_string
    @test underscore("foo-bar-baz") == test_string
    @test underscore("fooBarBaz") == test_string
    @test underscore("FooBarBaz") == test_string
    @test underscore("modelA") == "model_a"
    @test underscore("ModelA") == "model_a"
    @test underscore("aModel") == "a_model"
    @test underscore("AModel") == "amodel"

end

@testset "test underscore" begin
    test_string = "foo_bar_baz"
    @test underscore("foo_bar_baz") == test_string
    @test underscore("foo bar baz") == test_string
    @test underscore("foo-bar-baz") == test_string
    @test underscore("fooBarBaz") == test_string
    @test underscore("FooBarBaz") == test_string
    @test underscore("modelA") == "model_a"
    @test underscore("ModelA") == "model_a"
    @test underscore("aModel") == "a_model"
    @test underscore("AModel") == "amodel"
end

@testset "test dasherize" begin
    test_string = "foo-bar-baz"
    @test dasherize("foo_bar_baz") == test_string
    @test dasherize("foo bar baz") == test_string
    @test dasherize("foo-bar-baz") == test_string
    @test dasherize("fooBarBaz") == test_string
    @test dasherize("FooBarBaz") == test_string
    @test dasherize("modelA") == "model-a"
    @test dasherize("ModelA") == "model-a"
    @test dasherize("aModel") == "a-model"
    @test dasherize("AModel") == "amodel"
end

@testset "test decamelize" begin
    test_string = "foo_bar_baz"
    @test _decamelize("foo_bar_baz") == test_string
    @test _decamelize("foo bar baz") == "foo bar baz"
    @test _decamelize("foo-bar-baz") == "foo-bar-baz"
    @test _decamelize("fooBarBaz") == test_string
    @test _decamelize("FooBarBaz") == test_string
    @test _decamelize("modelA") == "model_a"
    @test _decamelize("ModelA") == "model_a"
    @test _decamelize("aModel") == "a_model"
    @test _decamelize("AModel") == "amodel"
end

@testset "test spaces" begin
    test_string = "boo"
    @test _defaultcase("boo") == test_string
    @test _defaultcase("  boo") == test_string
    @test _defaultcase("boo  ") == test_string
    @test _defaultcase(" boo ") == test_string
end


@testset "camelize" begin
    @test camelize("innerHTML") == "innerHTML"
    @test camelize("action_name") == "actionName"
    @test camelize("css-class-name") == "cssClassName"
    @test camelize("my favorite items") == "myFavoriteItems"
    @test camelize("My Favorite Items") == "myFavoriteItems"
    @test camelize("private-docs/owner-invoice") == "privateDocs/ownerInvoice"
end

@testset "capitalize" begin
    @test capitalize("innerHTML") == "InnerHTML"
    @test capitalize("action_name") == "Action_name"
    @test capitalize("css-class-name") == "Css-class-name"
    @test capitalize("my favorite items") == "My favorite items"
    @test capitalize("privateDocs/ownerInvoice") == "PrivateDocs/OwnerInvoice"
end

@testset "classify" begin
    @test classify("innerHTML") == "InnerHTML"
    @test classify("action_name") == "ActionName"
    @test classify("css-class-name") == "CssClassName"
    @test classify("my favorite items") == "MyFavoriteItems"
    @test classify("private-docs/owner-invoice") == "PrivateDocs/OwnerInvoice"
end

@testset "dasherize" begin
    @test dasherize("innerHTML") == "inner-html"
    @test dasherize("action_name") == "action-name"
    @test dasherize("css-class-name") == "css-class-name"
    @test dasherize("my favorite items") == "my-favorite-items"
    @test dasherize("privateDocs/ownerInvoice") == "private-docs/owner-invoice"
end

@testset "decamelize" begin
    @test decamelize("innerHTML") == "inner_html"
    @test decamelize("action_name") == "action_name"
    @test decamelize("css-class-name") == "css-class-name"
    @test decamelize("my favorite items") == "my favorite items"
end

@testset "underscore" begin
    @test underscore("innerHTML") == "inner_html"
    @test underscore("action_name") == "action_name"
    @test underscore("css-class-name") == "css_class_name"
    @test underscore("my favorite items") == "my_favorite_items"
    @test underscore("privateDocs/ownerInvoice") == "private_docs/owner_invoice"
end
