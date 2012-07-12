################################################################################
# Pre-accept the EULA
################################################################################
# The install script must find that the EULA has already been accepted or it
# will wait for user input, causing the RightScale instance to strand.
################################################################################
# Create the Cloudoptimizer config directory.  This is normally created by the 
# installer, but the installer requires that it already exist to contain the 
# EULA acceptance file, we must create it before the installer runs.
log "EULA: Starting"
log "Creating default config directory (/etc/cloudoptimizer)."
directory "/etc/cloudoptimizer" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

# Create the EULA acceptance file.  The content of the file doesn't matter, but we set it to
# "RS Accepted EULA" so that we can tell how it was generated.
# The file that the installation script checks changed in version 1.1.5, so for now, we just
# set both files.
log "Creating EULA acceptance files."

# For 0.9.4 and earlier
log "EULA: Creating old style EULA acceptance file."
file "/etc/cloudoptimizer/accept-eula.txt" do
  owner "root"
  group "root"
  mode "0755"
  content "RS Accepted EULA"
  action :create
end
# For 1.1.5 and later
log "EULA: Creating new style EULA acceptance file."
file "/etc/cloudoptimizer/accepted-cloudoptimizer-eula" do
  owner "root"
  group "root"
  mode "0755"
  content "true"
  action :create
end
log "EULA: Ending"