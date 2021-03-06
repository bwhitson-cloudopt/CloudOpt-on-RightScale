#
# Cookbook Name: SupportView
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "========== Beginning SupportView  =========="

case node[:cloudoptimizer][:supportview]
when "Upload a full archive"
  execute "supportview" do
    command "supportview -u"
  end
when "Upload a light archive"
  execute "supportview" do
    command "supportview -l"
  end
when "Create a local archive"
  execute "supportview" do
    command "supportview"
  end
end

unless node[:cloudoptimizer][:supportview] == "Do not run SupportView"
  log "===== Beginning SupportView for RightScale Audit Log ====="

  log "HOSTNAME:"
  execute "hostname" do
    command "hostname"
  end

  log "UNAME:"
  execute "uname" do
    command "uname -a"
  end

  log "LSB_RELEASE:"
  execute "lsb_release" do
    command "lsb_release -a"
  end

  log "CPUINFO:"
  execute "cat /proc/cpuinfo" do
    command "cat /proc/cpuinfo"
  end

  log "MEMINFO:"
  execute "cat /proc/meminfo" do
    command "cat /proc/meminfo"
  end

  log "IFCONFIG:"
  execute "ifconfig" do
    command "ifconfig -a"
  end

  log "DF:"
  execute "df" do
    command "df -Ph"
  end

  log "PS:"
  execute "ps" do
    command "ps -Afly"
  end

  log "CLOUDOPTIMIZER.CONF:"
  execute "more cloudoptimizer.conf" do
    command "more /etc/cloudoptimizer.conf"
  end

  log "TOP:"
  execute "top" do
    command "top -b -n1"
  end

  log "NETSTAT:"
  execute "netstat" do
    command "netstat -a"
  end

  log "HOME_DIR:"
  execute "ls" do
    command "ls -lR #{node[:cloudoptimizer_configuration][:file_locations][:home_directory]}"
  end

  log "CLOUDSTATS:"
  execute "cloudstats" do
    command "cloudstats"
  end

  log "CLOUDTRACE:"
  execute "cloudtrace" do
    command "cloudtrace show"
  end

  log "CLOUDTRACE STATS:"
  execute "cloudtrace stats" do
    command "cloudtrace stats show"
  end

  log "===== Ending SupportView for RightScale Audit Log ====="
end

log "========== Ending SupportView  =========="

