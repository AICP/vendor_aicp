# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := pa-overlays
LOCAL_REQUIRED_MODULES := \
    FontUbuntuOverlay \
    FontOpenSansOverlay \
    FontComfortaaOverlay \
    FontCaviarDreamsOverlay \
    FontExotwoOverlay \
    FontSnigletOverlay \
    FontSignikaOverlay \
    FontOxaniumOverlay

include $(BUILD_PHONY_PACKAGE)
include $(call first-makefiles-under,$(LOCAL_PATH))
