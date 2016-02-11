from setuptools import setup

setup(
    name='beancount_urlscheme',
    version='0.1.0',
    description='Utility to register the beancount:// URL scheme',
    url='http://github.com/aumayr/beancount_urlscheme',
    author='Dominik Aumayr',
    author_email='dominik@aumayr.name',
    license='MIT',
    packages=['beancount_urlscheme'],
    include_package_data=True,
    entry_points={
        'console_scripts': [
            'beancount_urlscheme = beancount_urlscheme.beancount_urlscheme:main',
        ]
    },
    install_requires=[],
    dependency_links=[],
    zip_safe=False
)
