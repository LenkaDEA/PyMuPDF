%define _unpackaged_files_terminate_build 1

%define modulename PyMuPDF
%define binName pymupdf
%def_without check

Name: python3-module-%modulename
Version: 1.24.2
Release: alt1

Summary: PyMuPDF is a high performance Python library for data extraction, analysis, conversion & manipulation of PDF (and other) documents
License: MIT
Group: Other
Url: https://pymupdf.readthedocs.io/
Vcs: https://github.com/pymupdf/PyMuPDF.git
#BuildArch: x86_64
Source: %name-%version.tar

BuildRequires(pre): rpm-build-python3
BuildRequires: python3-module-setuptools
BuildRequires: mupdf-devel
BuildRequires: swig
BuildRequires: libfreetype-devel
BuildRequires: libstdc++10-devel libstdc++-devel-static cpp libstdc++-devel build-essential

%if_with check
BuildRequires: python3-module-pytest
%endif

%description
%summary.

%prep
%setup

%build
#PYMUPDF_SETUP_IMPLEMENTATIONS=a CFLAGS="-I/usr/include/freetype2/ -I/usr/include/c++/13/ -I/usr/include/"  PYMUPDF_SETUP_MUPDF_BUILD="" %pyproject_build
%pyproject_build

%install
%pyproject_install

%check
#pyproject_run_pytest -ra tests

%files
%_bindir/%binName
#python3_sitelibdir/%modulename
%python3_sitelibdir/%modulename-%version.dist-info
%python3_sitelibdir/fitz_old
%doc README.md docs/
