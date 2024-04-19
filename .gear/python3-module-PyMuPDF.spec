%define _unpackaged_files_terminate_build 1

%define modulename PyMuPDF
%def_without check

Name: python3-module-%modulename
Version: 1.24.1
Release: alt1

Summary: PyMuPDF is a high performance Python library for data extraction, analysis, conversion & manipulation of PDF (and other) documents
License: MIT
Group: Other
Url: https://pymupdf.readthedocs.io/
Vcs: https://github.com/pymupdf/PyMuPDF.git
BuildArch: noarch
Source: %name-%version.tar

BuildRequires(pre): rpm-build-python3
BuildRequires: python3-module-setuptools
BuildRequires: mupdf-devel
BuildRequires: swig
BuildRequires: libfreetype-devel

%if_with check
BuildRequires: python3-module-pytest
%endif

%description
%summary.

%prep
%setup

%build
LDFLAGS="-L /usr/include/freetype2/"
CFLAGS="-I /usr/include/freetype2/"
PYMUPDF_SETUP_MUPDF_BUILD="/usr/include/mupdf/"
%pyproject_build

%install
%pyproject_install

%check
%pyproject_run_pytest -ra tests

%files
#%_bindir/%modulename
#%python3_sitelibdir/%modulename
#%python3_sitelibdir/%modulename-%version.dist-info
#%doc README.md LICENSE docs/contributing.md docs/index.md docs/cli.md
