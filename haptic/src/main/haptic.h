#ifndef HAPTIC_H
#define HAPTIC_H

#include "core/object/object.h"
#include "core/object/class_db.h"

class Haptic : public Object {
    GDCLASS(Haptic, Object);

    protected:
        static void _bind_methods();
		static Haptic* instance;

    public:
        void selection();
		void impact(int style);

		Haptic();
        ~Haptic();
};

#endif
