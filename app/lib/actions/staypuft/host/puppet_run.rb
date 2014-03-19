#
# Copyright 2014 Red Hat, Inc.
#
# This software is licensed to you under the GNU General Public
# License as published by the Free Software Foundation; either version
# 2 of the License (GPLv2) or (at your option) any later version.
# There is NO WARRANTY for this software, express or implied,
# including the implied warranties of MERCHANTABILITY,
# NON-INFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. You should
# have received a copy of GPLv2 along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.

module Actions
  module Staypuft
    module Host
      class PuppetRun < Actions::Base

        middleware.use Actions::Staypuft::Middleware::AsCurrentUser

        def plan(host)
          Type! host, ::Host
          plan_self id: host.id, name: host.name
        end

        def run
          ::Host.find(id).puppetrun!
        end

        def humanized_input
          input[:name]
        end

      end
    end
  end
end