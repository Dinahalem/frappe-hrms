FROM frappe/erpnext:latest

COPY . /home/frappe/frappe-bench/apps/hrms
COPY entrypoint.sh /entrypoint.sh

USER frappe

ENTRYPOINT ["/entrypoint.sh"]
