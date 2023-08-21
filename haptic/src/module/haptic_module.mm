#import "haptic_module.h"

#import "core/config/engine.h"

#import "../main/haptic.h"

Haptic* haptic;

void register_haptic_types() {
    haptic = memnew(Haptic);
    Engine::get_singleton()->add_singleton(Engine::Singleton("Haptic", haptic));
}

void unregister_haptic_types() {
    if (haptic) {
       memdelete(haptic);
   }
}
