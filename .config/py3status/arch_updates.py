class Py3status:
    format = "ARCH: {count}"

    def _update_count(self):
        packer = self.py3.check_commands('packer')

        try:
            updates_available = self.py3.command_output([packer, '-Syu', '--quickcheck'])
            return len(updates_available.split("\n"))
        except CommandError:
            self.py3.error('packer failed')

    def arch_updates(self):
        data = { 'count': self._update_count() }

        return {
            'full_text': self.py3.safe_format(self.format, data),
            'cached_until': self.py3.CACHE_FOREVER
        }

if __name__ == '__main__':
    from py3status.module_test import module_test
    module_test(Py3status, {})
