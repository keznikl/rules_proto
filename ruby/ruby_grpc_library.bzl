load("//ruby:ruby_grpc_compile.bzl", "ruby_grpc_compile")
load("@com_github_yugui_rules_ruby//ruby:def.bzl", "ruby_library")

def ruby_grpc_library(**kwargs):
    name = kwargs.get("name")
    deps = kwargs.get("deps")
    visibility = kwargs.get("visibility")

    name_pb = name + "_pb"

    ruby_grpc_compile(
        name = name_pb,
        deps = deps,
        visibility = visibility,
        verbose = kwargs.pop("verbose", 0),
        transitivity = kwargs.pop("transitivity", {}),
        transitive = kwargs.pop("transitive", True),
    )

    ruby_library(
        name = name,
        srcs = [name_pb],
        includes = ["{package}/%s" % name_pb],
        visibility = visibility,
    )
