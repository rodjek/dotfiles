from mailbox import Maildir, NoSuchMailboxError
from os import listdir
from os.path import join, isfile

class Py3status:
    format = "MAIL: {count}"
    path = '~/.mail'

    def _unread_count(self):
        try:
            mbox = Maildir(self.path, create=False)
            new_dir = mbox._paths['new']
            return len(list(filter(lambda r: isfile(join(new_dir, r)), listdir(new_dir))))
        except (NoSuchMailboxError, FileNotFoundError):
            self.py3.error(self.py3.get_composite_string(self.py3.safe_format('{dir} is not a maildir', { 'dir': self.path }, True)))

    def maildir(self):
        data = { 'count': self._unread_count() }

        return {
            'full_text': self.py3.safe_format(self.format, data),
            'cached_until': self.py3.time_in(60)
        }

if __name__ == '__main__':
    config = {
        'path': '~/.mail/personal/INBOX'
    }
    from py3status.module_test import module_test
    module_test(Py3status, config)
