
module Main (main) where

import Prelude
-- import Components.TaskList (initialTaskListState, taskList)
-- import Control.Monad.Eff (Eff)
-- import DOM (DOM) as DOM
-- import Thermite as T

-- -- | The main method creates the task list component, and renders it to the document body.
-- main :: Eff (dom :: DOM.DOM) Unit
-- main = T.defaultMain taskList initialTaskListState unit

import Task

import Thermite as T

-- import React as R
import React.DOM as R
import React.DOM.Props as RP
-- import ReactDOM as RDOM
import Data.URI.Common as DUC
import Data.String as DS
import Data.Array (take, length) as DA
import Data.List.Types as DLT



import Unsafe.Coerce (unsafeCoerce)

import Data.Maybe
import Data.List as L

import Data.Tuple

import Data.Either

import Data.Lens

-- main = T.defaultMain spec initialState unit
main = T.defaultMain taskList initialTaskListState unit


data TaskListAction = NewTask | TaskAction Int TaskAction

type TaskListState = { tasks :: L.List TaskState }

initialTaskListState = { tasks : L.Nil }

performAction :: T.PerformAction _ TaskListState _ TaskListAction
performAction NewTask _ state =
  void $ T.modifyState $ \state -> state { tasks = L.Cons { text: "abc" } state.tasks }
performAction (TaskAction i RemoveTask) _ state =
  void $ T.modifyState $ \state -> state { tasks = fromMaybe state.tasks (L.deleteAt i state.tasks) }
performAction _ _ _ = pure unit

_tasks :: Lens' TaskListState (L.List TaskState)
-- _tasks = lens _.tasks (_ { tasks = _ } )
-- also
_tasks = lens (\state -> state.tasks)
              (\state tasks -> state { tasks = tasks })

_TaskAction :: Prism' TaskListAction (Tuple Int TaskAction)
_TaskAction = prism (uncurry TaskAction) \ta ->
  case ta of
    TaskAction i a  -> Right (Tuple i a)
    _               -> Left ta

taskList :: T.Spec _ TaskListState _ TaskListAction
taskList = 
  header 

header :: T.Spec _ TaskListState _ TaskListAction
header = T.simpleSpec performAction render
  where
    render :: T.Render TaskListState _ TaskListAction
    render send _ state _ =
      [ R.p'  [ R.button  [ RP.onClick \_ -> send NewTask ] 
                          [ R.text "New Task" 
                          ]
              ],
        R.p' [ R.text "xyz" ]
      ]



-- from https://bodil.lol/pure-ui/#30
-- module Main where

-- import Prelude
-- import Control.Monad.Eff.Console (log)
-- import DOM (DOM)
-- import DOM.HTML (window)
-- import DOM.HTML.Types (htmlDocumentToParentNode)
-- import DOM.HTML.Window (document)
-- import DOM.Node.ParentNode (querySelector)
-- import DOM.Node.Types (elementToNode, Node)
-- import Data.Maybe (Maybe(Just, Nothing), maybe)
-- import Data.Nullable (toMaybe)
-- import Data.VirtualDOM (patch, text, prop, h)
-- import Data.VirtualDOM.DOM (api)

-- main = do
--   doc ← window >>= document >>=
--     htmlDocumentToParentNode >>> pure
--   target ← querySelector "#target" doc >>=
--     toMaybe >>> map elementToNode >>> pure
--   maybe (log "No div#target found!") view target
