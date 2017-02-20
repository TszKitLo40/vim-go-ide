try:
    import concurrent.futures as futures
except ImportError:
    try:
        import futures
    except ImportError:
        futures = None

import zipfile
import shutil
import tempfile
import requests

from os import path


#--- Globals ----------------------------------------------
PLUGINS = """
ack.vim https://github.com/mileszs/ack.vim
ag.vim https://github.com/rking/ag.vim
bufexplorer https://github.com/corntrace/bufexplorer
colour-sampler-pack https://github.com/vim-scripts/Colour-Sampler-Pack
csapprox https://github.com/vim-scripts/CSApprox
ctrlp.vim https://github.com/ctrlpvim/ctrlp.vim
goyo.vim https://github.com/junegunn/goyo.vim
gruvbox https://github.com/morhetz/gruvbox
lightline.vim https://github.com/itchyny/lightline.vim
mayansmoke https://github.com/vim-scripts/mayansmoke
nerdtree https://github.com/scrooloose/nerdtree
neocomplete.vim https://github.com/Shougo/neocomplete.vim
nginx-vim-syntax https://github.com/evanmiller/nginx-vim-syntax
open_file_under_cursor.vim https://github.com/amix/open_file_under_cursor.vim
scrollcolors https://github.com/vim-scripts/ScrollColors
snipmate-snippets https://github.com/scrooloose/snipmate-snippets
syntastic https://github.com/scrooloose/syntastic
tagbar https://github.com/majutsushi/tagbar
tlib https://github.com/vim-scripts/tlib
ultisnips https://github.com/SirVer/ultisnips
vim-addon-mw-utils https://github.com/MarcWeber/vim-addon-mw-utils
vim-bundle-mako https://github.com/sophacles/vim-bundle-mako
vim-coffee-script https://github.com/kchmck/vim-coffee-script
vim-colors-solarized https://github.com/altercation/vim-colors-solarized
vim-commentary https://github.com/tpope/vim-commentary
vim-expand-region https://github.com/terryma/vim-expand-region
vim-flake8 https://github.com/nvie/vim-flake8
vim-fugitive https://github.com/tpope/vim-fugitive
vim-gitgutter https://github.com/airblade/vim-gitgutter
vim-go https://github.com/fatih/vim-go
vim-indent-object https://github.com/michaeljsmith/vim-indent-object
vim-less https://github.com/groenewege/vim-less
vim-markdown https://github.com/tpope/vim-markdown
vim-multiple-cursors https://github.com/terryma/vim-multiple-cursors
vim-pug https://github.com/digitaltoad/vim-pug
vim-pyte https://github.com/therubymug/vim-pyte
vim-repeat https://github.com/tpope/vim-repeat
vim-snipmate https://github.com/garbas/vim-snipmate
vim-snippets https://github.com/honza/vim-snippets
vim-surround https://github.com/tpope/vim-surround
vim-yankstack https://github.com/maxbrunsfeld/vim-yankstack
vim-zenroom2 https://github.com/amix/vim-zenroom2
""".strip()

GITHUB_ZIP = '%s/archive/master.zip'

SOURCE_DIR = path.join(path.dirname(__file__), 'sources_non_forked')


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    temp_zip_path = path.join(temp_dir, plugin_name)

    # Download and extract file in temp dir
    req = requests.get(zip_path)
    open(temp_zip_path, 'wb').write(req.content)

    zip_f = zipfile.ZipFile(temp_zip_path)
    zip_f.extractall(temp_dir)

    plugin_temp_path = path.join(temp_dir,
                                 path.join(temp_dir, '%s-master' % plugin_name))

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)

    print('Updated {0}'.format(plugin_name))


def update(plugin):
    name, github_url = plugin.split(' ')
    zip_path = GITHUB_ZIP % github_url
    download_extract_replace(name, zip_path,
                             temp_directory, SOURCE_DIR)


if __name__ == '__main__':
    temp_directory = tempfile.mkdtemp()

    try:
        if futures:
            with futures.ThreadPoolExecutor(16) as executor:
                executor.map(update, PLUGINS.splitlines())
        else:
            [update(x) for x in PLUGINS.splitlines()]
    finally:
        shutil.rmtree(temp_directory)
