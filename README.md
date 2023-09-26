# Moodle-buildpack

Buildpack for running a Moodle instance on a Cloud Platform (Scalingo, Clever Cloud, Dokku, Heroku, etc.).

## Moodle

[Moodle](https://moodle.org) is a free, online Learning Management system enabling educators to create their own private website filled with dynamic courses that extend learning, any time, anywhere.

It is mainly a PHP + MySQL/MariaDB application.

## Buildpack

This buildpack does the following, see `bin/compile`:
- for a given release/tag, it downloads (via a cUrl command) the Moodle archive
- unzip it

The version of the Moodle is defined in the `bin/version` file.

This buildpack follows the [Cloud Native Buildpacks Specification](https://github.com/buildpacks/spec). So it should be compatible with [Scalingo](https://doc.scalingo.com/platform/deployment/buildpacks/custom), [Dokku](http://dokku.viewdocs.io/dokku~v0.5.0/deployment/buildpacks/) or [Heroku](https://devcenter.heroku.com/articles/buildpacks).

## Moodle releases

Each tag of this repository corresponds to a Moodle official release.

For example, tag `v4.2.2` corresponds to [Moodle#4.2.2](https://download.moodle.org/download.php/stable402/moodle-4.2.2.zip).

## Usage

In your Cloud application, define it as a multi-buildpacks application with moodle-buildpack and a php-based buildpack.

For example, for Scalingo, create a `.buildpacks` with:

```shell script
https://github.com/edulib-france/moodle-buildpack#v3.14.1
https://github.com/Scalingo/php-buildpack
```

You can find a production-ready application [here](https://github.com/edulib-france/moodle-scalingo-deploy).

## Upgrading

Releasing a new version of this buildpack is as easy as running the command:

```shell script
./upgrade-moodle-version <new_moodle_version> #ex: 3.14.2
```

This script does the following:
- change the `bin/version` with the one given in parameter
- declare and push a new tag named `vX.Y.Z`

## Rebuild an already published version

If you need to re-publish a version for some reasons, simply make your changes, then run:

```shell script
# some changes and git operations
git tag -d v3.14.1 && \
  git push --delete origin v3.14.1 && \
  git tag -a "v3.14.1" -m "Release v3.14.1" && \
  git push --tag
```

## License

This software has been distributed under [AGPL-3.0 license](https://choosealicense.com/licenses/agpl-3.0/).
